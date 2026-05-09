; DESCRIPTION: Places a orange 85x74 rectangle at position (298, 54).
; PLAN: r0=298(x), r1=54(y), r2=85(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 54
LDI r2, 85
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
