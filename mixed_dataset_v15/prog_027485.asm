; DESCRIPTION: Places a blue 113x61 rectangle at position (4, 154).
; PLAN: r0=4(x), r1=154(y), r2=113(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 154
LDI r2, 113
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
