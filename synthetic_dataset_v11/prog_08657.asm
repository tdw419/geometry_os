; DESCRIPTION: Renders a cyan box of size 110x64 starting at (102, 129).
; PLAN: r0=102(x), r1=129(y), r2=110(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 129
LDI r2, 110
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
