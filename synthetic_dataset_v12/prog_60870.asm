; DESCRIPTION: Places a blue 49x120 rectangle at position (458, 107).
; PLAN: r0=458(x), r1=107(y), r2=49(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 107
LDI r2, 49
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
