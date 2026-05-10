; starfield_v4.asm -- Dark sky with stars using a loop approach
; Uses FILL for background, loop with hardcoded star table

; Fill dark navy background
LDI r0, 0x080818
FILL r0

; Draw stars using a simple approach: draw bright dots at fixed positions
; Since PSET needs registers, we batch them efficiently

; Star 1
LDI r1, 23
LDI r2, 17
LDI r3, 0xFFFFFF
PSET r1, r2, r3
; Star 2
LDI r1, 67
LDI r2, 42
PSET r1, r2, r3
; Star 3
LDI r1, 112
LDI r2, 8
PSET r1, r2, r3
; Star 4
LDI r1, 189
LDI r2, 33
PSET r1, r2, r3
; Star 5
LDI r1, 241
LDI r2, 19
PSET r1, r2, r3
; Star 6
LDI r1, 35
LDI r2, 89
PSET r1, r2, r3
; Star 7
LDI r1, 143
LDI r2, 67
PSET r1, r2, r3
; Star 8
LDI r1, 211
LDI r2, 91
PSET r1, r2, r3
; Star 9
LDI r1, 58
LDI r2, 134
PSET r1, r2, r3
; Star 10
LDI r1, 177
LDI r2, 112
PSET r1, r2, r3
; Star 11
LDI r1, 12
LDI r2, 178
PSET r1, r2, r3
; Star 12
LDI r1, 99
LDI r2, 156
PSET r1, r2, r3
; Star 13
LDI r1, 223
LDI r2, 143
PSET r1, r2, r3
; Star 14
LDI r1, 44
LDI r2, 201
PSET r1, r2, r3
; Star 15
LDI r1, 167
LDI r2, 187
PSET r1, r2, r3

; Medium stars (0xAAAAAA)
LDI r3, 0xAAAAAA
LDI r1, 15
LDI r2, 55
PSET r1, r2, r3
LDI r1, 78
LDI r2, 23
PSET r1, r2, r3
LDI r1, 134
LDI r2, 45
PSET r1, r2, r3
LDI r1, 200
LDI r2, 12
PSET r1, r2, r3
LDI r1, 250
LDI r2, 67
PSET r1, r2, r3
LDI r1, 29
LDI r2, 123
PSET r1, r2, r3
LDI r1, 95
LDI r2, 98
PSET r1, r2, r3
LDI r1, 155
LDI r2, 134
PSET r1, r2, r3
LDI r1, 230
LDI r2, 156
PSET r1, r2, r3
LDI r1, 50
LDI r2, 167
PSET r1, r2, r3

; Dim stars (0x555555)
LDI r3, 0x555555
LDI r1, 42
LDI r2, 7
PSET r1, r2, r3
LDI r1, 91
LDI r2, 34
PSET r1, r2, r3
LDI r1, 158
LDI r2, 28
PSET r1, r2, r3
LDI r1, 220
LDI r2, 55
PSET r1, r2, r3
LDI r1, 17
LDI r2, 76
PSET r1, r2, r3
LDI r1, 73
LDI r2, 112
PSET r1, r2, r3
LDI r1, 145
LDI r2, 89
PSET r1, r2, r3
LDI r1, 198
LDI r2, 167
PSET r1, r2, r3
LDI r1, 36
LDI r2, 145
PSET r1, r2, r3
LDI r1, 110
LDI r2, 200
PSET r1, r2, r3

; Very dim stars (0x333333)
LDI r3, 0x333333
LDI r1, 33
LDI r2, 198
PSET r1, r2, r3
LDI r1, 77
LDI r2, 145
PSET r1, r2, r3
LDI r1, 166
LDI r2, 56
PSET r1, r2, r3
LDI r1, 215
LDI r2, 223
PSET r1, r2, r3
LDI r1, 128
LDI r2, 167
PSET r1, r2, r3
LDI r1, 53
LDI r2, 89
PSET r1, r2, r3
LDI r1, 192
LDI r2, 45
PSET r1, r2, r3
LDI r1, 248
LDI r2, 134
PSET r1, r2, r3
LDI r1, 18
LDI r2, 212
PSET r1, r2, r3
LDI r1, 104
LDI r2, 78
PSET r1, r2, r3

HALT
