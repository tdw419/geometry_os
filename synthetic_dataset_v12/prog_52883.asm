; DESCRIPTION: Places a blue 69x64 rectangle at position (146, 71).
; PLAN: r0=146(x), r1=71(y), r2=69(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 71
LDI r2, 69
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
