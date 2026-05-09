; DESCRIPTION: Places a red 89x52 rectangle at position (171, 42).
; PLAN: r0=171(x), r1=42(y), r2=89(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 42
LDI r2, 89
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
