; DESCRIPTION: Places a red 85x75 rectangle at position (398, 83).
; PLAN: r0=398(x), r1=83(y), r2=85(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 83
LDI r2, 85
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
