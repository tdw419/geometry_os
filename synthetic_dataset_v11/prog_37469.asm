; DESCRIPTION: Places a green 111x112 rectangle at position (96, 112).
; PLAN: r0=96(x), r1=112(y), r2=111(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 112
LDI r2, 111
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
