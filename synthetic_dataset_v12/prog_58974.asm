; DESCRIPTION: Renders a cyan box of size 43x47 starting at (272, 198).
; PLAN: r0=272(x), r1=198(y), r2=43(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 198
LDI r2, 43
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
