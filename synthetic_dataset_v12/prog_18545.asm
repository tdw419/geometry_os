; DESCRIPTION: Places a blue 46x41 rectangle at position (387, 30).
; PLAN: r0=387(x), r1=30(y), r2=46(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 30
LDI r2, 46
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
