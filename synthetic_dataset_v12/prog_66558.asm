; DESCRIPTION: Places a blue 41x38 rectangle at position (326, 59).
; PLAN: r0=326(x), r1=59(y), r2=41(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 59
LDI r2, 41
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
