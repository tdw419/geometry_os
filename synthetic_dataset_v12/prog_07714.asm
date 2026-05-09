; DESCRIPTION: Places a red 48x25 rectangle at position (323, 187).
; PLAN: r0=323(x), r1=187(y), r2=48(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 187
LDI r2, 48
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
