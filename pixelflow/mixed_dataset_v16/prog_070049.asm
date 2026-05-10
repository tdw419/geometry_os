; DESCRIPTION: Renders a cyan box of size 33x73 starting at (454, 178).
; PLAN: r0=454(x), r1=178(y), r2=33(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 178
LDI r2, 33
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
