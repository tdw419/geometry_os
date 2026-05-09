; DESCRIPTION: Places a red 112x45 rectangle at position (237, 159).
; PLAN: r0=237(x), r1=159(y), r2=112(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 159
LDI r2, 112
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
