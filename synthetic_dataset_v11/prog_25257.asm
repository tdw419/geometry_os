; DESCRIPTION: Renders a cyan box of size 79x73 starting at (123, 44).
; PLAN: r0=123(x), r1=44(y), r2=79(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 44
LDI r2, 79
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
