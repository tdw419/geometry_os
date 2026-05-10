; DESCRIPTION: Places a cyan 93x95 rectangle at position (39, 154).
; PLAN: r0=39(x), r1=154(y), r2=93(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 154
LDI r2, 93
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
