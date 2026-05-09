; DESCRIPTION: Renders a cyan box of size 39x80 starting at (441, 121).
; PLAN: r0=441(x), r1=121(y), r2=39(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 121
LDI r2, 39
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
