; DESCRIPTION: Places a blue 95x50 rectangle at position (415, 127).
; PLAN: r0=415(x), r1=127(y), r2=95(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 127
LDI r2, 95
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
