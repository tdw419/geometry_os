; DESCRIPTION: Places a purple 91x64 rectangle at position (103, 30).
; PLAN: r0=103(x), r1=30(y), r2=91(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 30
LDI r2, 91
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
