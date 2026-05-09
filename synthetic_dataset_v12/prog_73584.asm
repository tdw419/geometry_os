; DESCRIPTION: Places a green 112x120 rectangle at position (263, 92).
; PLAN: r0=263(x), r1=92(y), r2=112(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 92
LDI r2, 112
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
