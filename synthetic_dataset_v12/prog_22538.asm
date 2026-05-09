; DESCRIPTION: Places a red 50x75 rectangle at position (20, 107).
; PLAN: r0=20(x), r1=107(y), r2=50(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 107
LDI r2, 50
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
