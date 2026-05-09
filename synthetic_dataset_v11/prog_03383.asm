; DESCRIPTION: Renders a cyan box of size 39x47 starting at (8, 108).
; PLAN: r0=8(x), r1=108(y), r2=39(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 108
LDI r2, 39
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
