; DESCRIPTION: Places a magenta 16x68 rectangle at position (271, 38).
; PLAN: r0=271(x), r1=38(y), r2=16(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 38
LDI r2, 16
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
