; DESCRIPTION: Places a red 118x52 rectangle at position (294, 163).
; PLAN: r0=294(x), r1=163(y), r2=118(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 163
LDI r2, 118
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
