; DESCRIPTION: Places a magenta 39x71 rectangle at position (198, 73).
; PLAN: r0=198(x), r1=73(y), r2=39(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 73
LDI r2, 39
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
