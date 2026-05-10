; DESCRIPTION: Places a red 86x41 box at position (394, 124).
; PLAN: r0=394(x), r1=124(y), r2=86(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 124
LDI r2, 86
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
