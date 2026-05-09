; DESCRIPTION: Renders a white box of size 40x64 starting at (305, 80).
; PLAN: r0=305(x), r1=80(y), r2=40(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 80
LDI r2, 40
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
