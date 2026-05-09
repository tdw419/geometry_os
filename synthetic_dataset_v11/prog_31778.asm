; DESCRIPTION: Places a magenta 67x86 rectangle at position (157, 152).
; PLAN: r0=157(x), r1=152(y), r2=67(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 152
LDI r2, 67
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
