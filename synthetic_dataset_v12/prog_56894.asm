; DESCRIPTION: Places a white 33x90 rectangle at position (468, 54).
; PLAN: r0=468(x), r1=54(y), r2=33(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 54
LDI r2, 33
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
