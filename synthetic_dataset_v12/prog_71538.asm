; DESCRIPTION: Renders a cyan box of size 21x21 starting at (301, 37).
; PLAN: r0=301(x), r1=37(y), r2=21(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 37
LDI r2, 21
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
