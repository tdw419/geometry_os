; DESCRIPTION: Places a white 52x86 rectangle at position (298, 5).
; PLAN: r0=298(x), r1=5(y), r2=52(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 5
LDI r2, 52
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
