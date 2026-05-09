; DESCRIPTION: Places a cyan 92x81 rectangle at position (22, 95).
; PLAN: r0=22(x), r1=95(y), r2=92(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 95
LDI r2, 92
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
