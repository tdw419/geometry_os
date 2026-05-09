; DESCRIPTION: Places a cyan 39x115 rectangle at position (25, 124).
; PLAN: r0=25(x), r1=124(y), r2=39(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 124
LDI r2, 39
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
