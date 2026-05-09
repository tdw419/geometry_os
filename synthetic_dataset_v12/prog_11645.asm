; DESCRIPTION: Creates a cyan circular shape at (196, 121) with radius 72.
; PLAN: r0=196(x), r1=121(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 121
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
