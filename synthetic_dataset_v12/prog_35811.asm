; DESCRIPTION: Places a magenta 42x20 rectangle at position (180, 213).
; PLAN: r0=180(x), r1=213(y), r2=42(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 213
LDI r2, 42
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
