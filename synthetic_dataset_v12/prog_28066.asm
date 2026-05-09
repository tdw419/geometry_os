; DESCRIPTION: Places a cyan 38x47 rectangle at position (39, 124).
; PLAN: r0=39(x), r1=124(y), r2=38(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 124
LDI r2, 38
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
