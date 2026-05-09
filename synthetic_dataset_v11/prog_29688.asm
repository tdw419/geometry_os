; DESCRIPTION: Places a red 41x64 rectangle at position (63, 55).
; PLAN: r0=63(x), r1=55(y), r2=41(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 55
LDI r2, 41
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
