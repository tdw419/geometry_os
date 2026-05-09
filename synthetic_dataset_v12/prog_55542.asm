; DESCRIPTION: Places a white 110x56 rectangle at position (298, 12).
; PLAN: r0=298(x), r1=12(y), r2=110(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 12
LDI r2, 110
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
