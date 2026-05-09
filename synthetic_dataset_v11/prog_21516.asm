; DESCRIPTION: Places a yellow 67x64 rectangle at position (135, 168).
; PLAN: r0=135(x), r1=168(y), r2=67(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 168
LDI r2, 67
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
