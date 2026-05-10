; DESCRIPTION: Places a blue 112x34 rectangle at position (168, 164).
; PLAN: r0=168(x), r1=164(y), r2=112(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 164
LDI r2, 112
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
