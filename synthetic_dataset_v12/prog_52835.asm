; DESCRIPTION: Places a red 109x30 rectangle at position (394, 214).
; PLAN: r0=394(x), r1=214(y), r2=109(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 214
LDI r2, 109
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
