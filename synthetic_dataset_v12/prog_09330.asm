; DESCRIPTION: Places a blue 107x73 rectangle at position (296, 93).
; PLAN: r0=296(x), r1=93(y), r2=107(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 93
LDI r2, 107
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
