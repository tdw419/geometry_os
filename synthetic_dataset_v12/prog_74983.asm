; DESCRIPTION: Renders a yellow box of size 113x64 starting at (165, 188).
; PLAN: r0=165(x), r1=188(y), r2=113(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 188
LDI r2, 113
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
