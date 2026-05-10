; DESCRIPTION: Places a blue 73x41 rectangle at position (326, 213).
; PLAN: r0=326(x), r1=213(y), r2=73(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 213
LDI r2, 73
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
