; DESCRIPTION: Places a red 50x52 rectangle at position (439, 37).
; PLAN: r0=439(x), r1=37(y), r2=50(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 37
LDI r2, 50
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
