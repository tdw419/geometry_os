; DESCRIPTION: Places a red 85x32 rectangle at position (164, 113).
; PLAN: r0=164(x), r1=113(y), r2=85(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 113
LDI r2, 85
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
