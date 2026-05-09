; DESCRIPTION: Places a red 109x21 rectangle at position (360, 186).
; PLAN: r0=360(x), r1=186(y), r2=109(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 186
LDI r2, 109
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
