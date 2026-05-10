; DESCRIPTION: Places a cyan 34x36 rectangle at position (298, 63).
; PLAN: r0=298(x), r1=63(y), r2=34(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 63
LDI r2, 34
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
