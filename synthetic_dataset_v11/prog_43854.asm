; DESCRIPTION: Places a cyan 111x54 rectangle at position (31, 177).
; PLAN: r0=31(x), r1=177(y), r2=111(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 177
LDI r2, 111
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
