; DESCRIPTION: Places a blue 96x50 rectangle at position (146, 41).
; PLAN: r0=146(x), r1=41(y), r2=96(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 41
LDI r2, 96
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
