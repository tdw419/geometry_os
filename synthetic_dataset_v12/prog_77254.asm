; DESCRIPTION: Places a cyan 92x68 rectangle at position (235, 100).
; PLAN: r0=235(x), r1=100(y), r2=92(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 100
LDI r2, 92
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
