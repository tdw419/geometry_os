; DESCRIPTION: Places a green dot at position (495, 113).
; PLAN: r0=495(x), r1=113(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 495
LDI r1, 113
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
