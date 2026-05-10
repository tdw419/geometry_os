; DESCRIPTION: Places a red 64x70 rectangle at position (403, 127).
; PLAN: r0=403(x), r1=127(y), r2=64(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 127
LDI r2, 64
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
