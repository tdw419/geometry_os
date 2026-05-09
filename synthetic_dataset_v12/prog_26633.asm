; DESCRIPTION: Places a red 65x118 rectangle at position (294, 117).
; PLAN: r0=294(x), r1=117(y), r2=65(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 117
LDI r2, 65
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
