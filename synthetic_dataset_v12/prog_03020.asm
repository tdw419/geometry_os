; DESCRIPTION: Places a red 24x36 rectangle at position (439, 162).
; PLAN: r0=439(x), r1=162(y), r2=24(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 162
LDI r2, 24
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
