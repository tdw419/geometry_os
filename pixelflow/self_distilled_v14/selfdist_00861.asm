; DESCRIPTION: Creates a cyan filled rectangle of size 104x79 starting at (187, 79).
; PLAN: r0=187(x), r1=79(y), r2=104(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 79
LDI r2, 104
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
