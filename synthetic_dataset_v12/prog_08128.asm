; DESCRIPTION: Renders a cyan box of size 16x90 starting at (445, 55).
; PLAN: r0=445(x), r1=55(y), r2=16(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 55
LDI r2, 16
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
